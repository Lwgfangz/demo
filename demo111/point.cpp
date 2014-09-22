#include "Point.h"

#include <math.h>

CLatLng::CLatLng()
{
	Set(0.0, 0.0);
}

CLatLng::CLatLng(NVDOUBLE d_lat, NVDOUBLE d_lng)
{
	Set(d_lat, d_lng);
}

CLatLng::CLatLng(const CLatLng& lat_lng)
{
	*this = lat_lng;
}

CLatLng::~CLatLng()
{

}

void CLatLng::operator=(const CLatLng& lat_lng)
{
	Set(lat_lng.lat, lat_lng.lng);
}

NVBOOL CLatLng::operator==(const CLatLng& lat_lng) const
{
	return lat == lat_lng.lat && lng == lat_lng.lng;
}

NVBOOL CLatLng::operator!=(const CLatLng& lat_lng) const
{
	return !(*this == lat_lng);
}

NVBOOL CLatLng::operator<(const CLatLng& lat_lng) const
{
	if (lat < lat_lng.lat)
	{
		return NV_TRUE;
	}

	if (lat == lat_lng.lat)
	{
		if (lng < lat_lng.lng)
		{
			return NV_TRUE;
		}
	}

	return NV_FALSE;
}

void CLatLng::Set(NVDOUBLE d_lat, NVDOUBLE d_lng)
{
	lat = d_lat;
	lng = d_lng;
}

void CLatLng::Set(const CScrPt& pt, const CScrPt& scr_center, const CLatLng& ll_center, NVDOUBLE d_scale)
{
	Set(pt.x, pt.y, scr_center.x, scr_center.y, ll_center.lat, ll_center.lng, d_scale);
}

void CLatLng::Set(NVINT32 n_x, NVINT32 n_y, NVINT32 n_center_x, NVINT32 n_center_y, NVDOUBLE d_center_lat, NVDOUBLE d_center_lng, NVDOUBLE d_scale)
{
	NVDOUBLE d_det_x = (NVDOUBLE)(n_x - n_center_x) * d_scale;
	NVDOUBLE d_det_y = (NVDOUBLE)(n_y - n_center_y) * d_scale;

	NVDOUBLE d_det_lat = -d_det_y / ONE_DEG_DIST;
	lat = d_center_lat + d_det_lat;

	NVDOUBLE d_det_lng = d_det_x / COS((d_center_lat + lat) / 2.0) / ONE_DEG_DIST;
	lng = d_center_lng + d_det_lng;
}

NVDOUBLE CLatLng::AzimuthDeg(NVDOUBLE d_lat, NVDOUBLE d_lng) const
{
	NVDOUBLE f_res = AzimuthRad(d_lat, d_lng);
	return R2D(f_res);
}

NVDOUBLE CLatLng::AzimuthDeg(const CLatLng& lat_lng) const
{
	return AzimuthDeg(lat_lng.lat, lat_lng.lng);
}

NVDOUBLE CLatLng::AzimuthRad(NVDOUBLE d_lat, NVDOUBLE d_lng) const
{
	NVDOUBLE d_det_lat = d_lat - lat;
	NVDOUBLE d_det_lng = d_lng - lng;

	if (fabs(d_det_lat) < 0.000001)
	{
		return d_det_lng > 0.0 ? PI / 2.0 : PI * 1.5;
	}

	if (fabs(d_det_lng) < 0.000001)
	{
		return d_det_lat > 0.0 ? 0 : PI;
	}

	NVDOUBLE d_azimuth = atan(d_det_lng / d_det_lat);
	if (d_azimuth >= 0.0)
	{
		if (d_det_lat < 0.0)
		{
			d_azimuth += PI;
		}
	}
	else
	{
		if (d_det_lat <= 0.0)
		{
			d_azimuth = PI + d_azimuth;
		}
		else
		{
			d_azimuth = 2 * PI + d_azimuth;
		}
	}

	return d_azimuth;
}

NVDOUBLE CLatLng::AzimuthRad(const CLatLng& lat_lng) const
{
	return AzimuthRad(lat_lng.lat, lat_lng.lng);
}

NVDOUBLE CLatLng::DistDeg(NVDOUBLE d_lat, NVDOUBLE d_lng) const
{
	NVDOUBLE d_det_lat = d_lat - lat;
	NVDOUBLE d_det_lng = d_lng - lng;
	return sqrt(d_det_lat * d_det_lat + d_det_lng * d_det_lng);
}

NVDOUBLE CLatLng::DistDeg(const CLatLng& lat_lng) const
{
	return DistDeg(lat_lng.lat, lat_lng.lng);
}

NVDOUBLE CLatLng::DistMeter(NVDOUBLE d_lat, NVDOUBLE d_lng) const
{
	NVDOUBLE d_det_x = (d_lat - lat) * ONE_DEG_DIST;
	NVDOUBLE d_det_y = (d_lng - lng) * ONE_DEG_DIST * COS((lat + d_lat) / 2.0);
	return sqrt(d_det_x * d_det_x + d_det_y * d_det_y);
}

NVDOUBLE CLatLng::DistMeter(const CLatLng& lat_lng) const
{
	return DistMeter(lat_lng.lat, lat_lng.lng);
}

NVBOOL CLatLng::GetPointOnDist(const CLatLng& lat_lng_to, NVDOUBLE d_dist, CLatLng& lat_lng) const
{
	NVDOUBLE d_dist_temp = DistMeter(lat_lng_to);
	if (d_dist_temp < d_dist)
	{
		return NV_FALSE;
	}

	if (lat == lat_lng_to.lat)
	{
		lat_lng.lat = lat;
		NVDOUBLE d_dist_deg = d_dist * ONE_METER_DEG * cos(D2R(lat));
		lat_lng.lng = lng < lat_lng_to.lng ? lng + d_dist_deg : lng - d_dist_deg;
	}
	else if (lng == lat_lng_to.lng)
	{
		NVDOUBLE d_dist_deg = d_dist * ONE_METER_DEG;
		lat_lng.lat = lat < lat_lng_to.lat ? lat + d_dist_deg : lat - d_dist_deg;
		lat_lng.lng = lng;

	}
	else
	{
		NVDOUBLE k = (lat_lng_to.lng - lng) / (lat_lng_to.lat - lat);
		NVDOUBLE d_cos = cos(D2R(lat));
		NVDOUBLE d_det_lat = d_dist / sqrt(1 + k * k * d_cos * d_cos) / ONE_DEG_DIST;
		d_det_lat = lat_lng_to.lat - lat < 0.0 ? -d_det_lat : d_det_lat;
		NVDOUBLE d_det_lng = k * d_det_lat;
		lat_lng.lat = lat + d_det_lat;
		lat_lng.lng = lng + d_det_lng;
	}

	return NV_TRUE;
}

NVBOOL CLatLng::IsSimular(const CLatLng& lat_lng, NVDOUBLE d_threshold) const
{
	return IsSimular(lat_lng.lat, lat_lng.lng, d_threshold);
}

NVBOOL CLatLng::IsSimular(NVDOUBLE d_lat, NVDOUBLE d_lng, NVDOUBLE d_threshold) const
{
	return fabs(lat - d_lat) < d_threshold
		&& fabs(lng - d_lng) < d_threshold;
}

NVUINT64 CLatLng::CombineIndex64(NVDOUBLE d_precise) const
{
	NVUINT64 u64_index = (NVUINT64)(lat / d_precise + 0.5);
	u64_index <<= 32;
	u64_index += (NVUINT64)(lng / d_precise + 0.5);

	return u64_index;
}

CScrPt::CScrPt()
{
	Set(0, 0);
}

CScrPt::CScrPt(NVINT32 n_x, NVINT32 n_y)
{
	Set(n_x, n_y);
}

CScrPt::CScrPt(const CScrPt& scr_pt)
{
	*this = scr_pt;
}

CScrPt::CScrPt(NVUINT32 u_val)
{
	Set(u_val);
}

CScrPt::~CScrPt()
{

}

void CScrPt::operator=(const CScrPt& scr_pt)
{
	Set(scr_pt.x, scr_pt.y);
}

NVBOOL CScrPt::operator==(const CScrPt& scr_pt) const
{
	return x == scr_pt.x && y == scr_pt.y;
}

NVBOOL CScrPt::operator!=(const CScrPt& scr_pt) const
{
	return !(*this == scr_pt);
}

void CScrPt::Set(NVINT32 n_x, NVINT32 n_y)
{
	x = n_x;
	y = n_y;
}

void CScrPt::Set(NVUINT32 u_val)
{
	x = (NVINT32)(u_val & 0x0000FFFF);
	y = (NVINT32)(u_val >> 16);
}

void CScrPt::Set(const CLatLng& lat_lng, const CLatLng& ll_center, const CScrPt& scr_center, NVDOUBLE d_scale)
{
	Set(lat_lng.lat, lat_lng.lng, ll_center.lat, ll_center.lng, scr_center.x, scr_center.y, d_scale);
}

void CScrPt::Set(NVDOUBLE d_lat, NVDOUBLE d_lng, NVDOUBLE d_center_lat, NVDOUBLE d_center_lng, NVINT32 n_center_x, NVINT32 n_center_y, NVDOUBLE d_scale)
{
	NVDOUBLE d_det_lat = d_lat - d_center_lat;
	NVDOUBLE d_det_lng = d_lng - d_center_lng;

	NVDOUBLE d_det_x = ONE_DEG_DIST * d_det_lng * COS((d_lat + d_center_lat) / 2.0);
	NVDOUBLE d_det_y = - ONE_DEG_DIST * d_det_lat;

	d_det_x /= d_scale;
	d_det_y /= d_scale;

	x = n_center_x + (NVINT32)(d_det_x + 0.5);
	y = n_center_y + (NVINT32)(d_det_y + 0.5);
}