#ifndef _POINT_H_
#define _POINT_H_

#include "BasicDataType.h"

class CScrPt;
class CLatLng
{
public:
	// 构造函数
	CLatLng();
	CLatLng(NVDOUBLE d_lat, NVDOUBLE d_lng);
	CLatLng(const CLatLng& lat_lng);

	// 析构函数
	~CLatLng();

public:
	// 运算符号重载
	virtual void operator=(const CLatLng& lat_lng);
	virtual NVBOOL operator==(const CLatLng& lat_lng) const;
	virtual NVBOOL operator!=(const CLatLng& lat_lng) const;
	virtual NVBOOL operator<(const CLatLng& lat_lng) const;

public:
	// 设置值
	virtual void Set(NVDOUBLE d_lat, NVDOUBLE d_lng);
	virtual void Set(const CScrPt& pt, const CScrPt& scr_center, const CLatLng& ll_center, NVDOUBLE d_scale);
	virtual void Set(NVINT32 n_x, NVINT32 n_y, NVINT32 n_center_x, NVINT32 n_center_y, NVDOUBLE d_center_lat, NVDOUBLE d_center_lng, NVDOUBLE d_scale);
	
	// 计算方位角
	NVDOUBLE AzimuthDeg(NVDOUBLE d_lat, NVDOUBLE d_lng) const;
	NVDOUBLE AzimuthDeg(const CLatLng& lat_lng) const;
	NVDOUBLE AzimuthRad(NVDOUBLE d_lat, NVDOUBLE d_lng) const;
	NVDOUBLE AzimuthRad(const CLatLng& lat_lng) const;

	// 计算距离
	NVDOUBLE DistDeg(NVDOUBLE d_lat, NVDOUBLE d_lng) const;
	NVDOUBLE DistDeg(const CLatLng& lat_lng) const;
	NVDOUBLE DistMeter(NVDOUBLE d_lat, NVDOUBLE d_lng) const;
	NVDOUBLE DistMeter(const CLatLng& lat_lng) const;

	// 按距离计算点位置
	NVBOOL GetPointOnDist(const CLatLng& lat_lng_to, NVDOUBLE d_dist, CLatLng& lat_lng) const;

	// 两点相近
	NVBOOL IsSimular(const CLatLng& lat_lng, NVDOUBLE d_threshold) const;
	NVBOOL IsSimular(NVDOUBLE d_lat, NVDOUBLE d_lng, NVDOUBLE d_threshold) const;

	// 组合成64位索引
	NVUINT64 CombineIndex64(NVDOUBLE d_precise) const;

public:
	NVDOUBLE lat;
	NVDOUBLE lng;
};

class CScrPt
{
public:
	// 构造函数
	CScrPt();
	CScrPt(NVINT32 n_x, NVINT32 n_y);
	CScrPt(const CScrPt& scr_pt);
	CScrPt(NVUINT32 u_val);

	// 析构函数
	~CScrPt();

public:
	// 重载运算符
	void operator=(const CScrPt& scr_pt);
	NVBOOL operator==(const CScrPt& scr_pt) const;
	NVBOOL operator!=(const CScrPt& scr_pt) const;

public:
	// 设置值
	virtual void Set(NVINT32 n_x, NVINT32 n_y);
	virtual void Set(NVUINT32 u_val);
	virtual void Set(const CLatLng& lat_lng, const CLatLng& ll_center, const CScrPt& scr_center, NVDOUBLE d_scale);
	virtual void Set(NVDOUBLE d_lat, NVDOUBLE d_lng, NVDOUBLE d_center_lat, NVDOUBLE d_center_lng, NVINT32 n_center_x, NVINT32 n_center_y, NVDOUBLE d_scale);

public:
	NVINT32 x;
	NVINT32 y;
};

#endif
