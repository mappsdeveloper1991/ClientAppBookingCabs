class ThingToDoAPIResponseData {
   String status;
   List<ThingToDoList> data;

  ThingToDoAPIResponseData({
    required this.status,
    required this.data,
  });

  factory ThingToDoAPIResponseData.fromJson(Map<String, dynamic> json) {
    return ThingToDoAPIResponseData(
      status: json['status'],
      data: List<ThingToDoList>.from(
        json['data'].map((x) => ThingToDoList.fromJson(x)),
      ),
    );
  }
}

class ThingToDoList {
   String? vendorName;
   String? vendorEmail;
   String? vendorMobile;
   int sId;
   int createdBy;
   int cityId;
   String sightseeingName;
   String cityName;
   String sightseeingCover;
   String sightseeingLatitude;
   //String sightseeingLogitude;
   String sightseeingAddress;
   String coverageKm;
   String coverageHrs;
   String difficultyLevel;
   int isUnique;
   String popularity;
   String youtubeUrl;
   String description;
   String meetingPoint;
   String highlights;
   int status;
   int vendorId;
   int tourType;
   String passenger;
   String fromDate;
   String toDate;
   int rateType;
   int ratePerFixed;
   int rateValue;
   int taxType;
   int taxPerFixed;
   int taxValue;
   String weekOff;
   String openingTime;
   String closingTime;
   String estimatedTime;
   int ageFrom;
   int ageTo;
   int transfer;
   String pickupPoint;
   String allocation;
   String cutOffDays;
   String pricePlanName;
   int stayMoreStatus;
   int seasonalDiscountStatus;
   int lastMinBookingStatus;
   int earlyBookingStatus;
   int daywiseDiscountStatus;
   String relatedTours;
   String brochureTitle;
   String brochureDesc;
   String metaKeywords;
   String metaTitle;
   String metaDesc;
   String paymentStructure;
   String paymentDocumentation;
   String cancellationPolicy;
   String refundPolicy;
   String termsConditionPolicy;
   String paymentStructureContent;
   String documentationContent;
   String cancellationPolicyContent;
   String refundPolicyContent;
   String termPolicyContent;
   String costInclusive;
   String costExclusive;
   String tourfaredata;
   String sightseingtype;
   String sightseeingcategory;
   String sightseeinglanguage;
   String season;
   String thingstocarry;
   String meal;
   String mainimages;
   String galleryimages;
   String seasonDiscount;
   String seasonDiscountLabel;

  ThingToDoList({
    required this.vendorName,
    required this.vendorEmail,
    required this.vendorMobile,
    required this.sId,
    required this.createdBy,
    required this.cityId,
    required this.sightseeingName,
    required this.cityName,
    required this.sightseeingCover,
    required this.sightseeingLatitude,
    //required this.sightseeingLogitude,
    required this.sightseeingAddress,
    required this.coverageKm,
    required this.coverageHrs,
    required this.difficultyLevel,
    required this.isUnique,
    required this.popularity,
    required this.youtubeUrl,
    required this.description,
    required this.meetingPoint,
    required this.highlights,
    required this.status,
    required this.vendorId,
    required this.tourType,
    required this.passenger,
    required this.fromDate,
    required this.toDate,
    required this.rateType,
    required this.ratePerFixed,
    required this.rateValue,
    required this.taxType,
    required this.taxPerFixed,
    required this.taxValue,
    required this.weekOff,
    required this.openingTime,
    required this.closingTime,

    required this.estimatedTime,
    required this.ageFrom,
    required this.ageTo,
    required this.transfer,
    required this.pickupPoint,
    required this.allocation,
    required this.cutOffDays,
    required this.pricePlanName,
    required this.stayMoreStatus,
    required this.seasonalDiscountStatus,
    required this.lastMinBookingStatus,
    required this.earlyBookingStatus,
    required this.daywiseDiscountStatus,
    required this.relatedTours,
    required this.brochureTitle,
    required this.brochureDesc,
    required this.metaKeywords,
    required this.metaTitle,
    required this.metaDesc,
    required this.paymentStructure,
    required this.paymentDocumentation,
    required this.cancellationPolicy,
    required this.refundPolicy,
    required this.termsConditionPolicy,
    required this.paymentStructureContent,
    required this.documentationContent,
    required this.cancellationPolicyContent,
    required this.refundPolicyContent,
    required this.termPolicyContent,
    required this.costInclusive,
    required this.costExclusive,
    required this.tourfaredata,
    required this.sightseingtype,
    required this.sightseeingcategory,
    required this.sightseeinglanguage,
    required this.season,
    required this.thingstocarry,
    required this.meal,
    required this.mainimages,
    required this.galleryimages,
    required this.seasonDiscount,
    required this.seasonDiscountLabel,
  });

  factory ThingToDoList.fromJson(Map<String, dynamic> json) {
  return ThingToDoList(
      vendorName: json['vendor_name'],
      vendorEmail: json['vendor_email'],
      vendorMobile: json['vendor_mobile'],
      sId: json['s_id'],
      createdBy: json['created_by'],
      cityId: json['city_id'],
      sightseeingName: json['sightseeing_name'],
      cityName: json['city_name'],
      sightseeingCover: json['sightseeing_cover'],
      sightseeingLatitude: json['sightseeing_latitude'],
      sightseeingAddress: json['sightseeing_address'],
      coverageKm: json['coverage_km'],
      coverageHrs: json['coverage_hrs'],
      difficultyLevel: json['difficulty_level'],
      isUnique: json['is_unique'],
      popularity: json['popularity'],
      youtubeUrl: json['youtube_url'],
      description: json['description'],
      meetingPoint: json['meeting_point'],
      highlights: json['highlights'],
      status: json['status'],
      vendorId: json['vendor_id'],
      tourType: json['tour_type'],
      passenger: json['passenger'],
      fromDate: json['from_date'],
      toDate: json['to_date'],
      rateType: json['rate_type'],
      ratePerFixed: json['rate_per_fixed'],
      rateValue: json['rate_value'],
      taxType: json['tax_type'],
      taxPerFixed: json['tax_per_fixed'],
      taxValue: json['tax_value'],
      weekOff: json['week_off'],
      openingTime: json['opening_time'],
      closingTime: json['closing_time'],
    estimatedTime: json['estimated_time'] ?? '',
    ageFrom: json['age_from'] ?? 0,
    ageTo: json['age_to'] ?? 0,
    transfer: json['transfer'] ?? 0,
    pickupPoint: json['pickup_point'] ?? '',
    allocation: json['allocation'] ?? '',
    cutOffDays: json['cut_off_days'] ?? '',
    pricePlanName: json['price_plan_name'] ?? '',
    stayMoreStatus: json['stay_more_status'] ?? 0,
    seasonalDiscountStatus: json['seasonal_discount_status'] ?? 0,
    lastMinBookingStatus: json['last_min_booking_status'] ?? 0,
    earlyBookingStatus: json['early_booking_status'] ?? 0,
    daywiseDiscountStatus: json['daywise_discount_status'] ?? 0,
    relatedTours: json['related_tours'] ?? '',
    brochureTitle: json['brochure_title'] ?? '',
    brochureDesc: json['brochure_desc'] ?? '',
    metaKeywords: json['meta_keywords'] ?? '',
    metaTitle: json['meta_title'] ?? '',
    metaDesc: json['meta_desc'] ?? '',
    paymentStructure: json['payment_structure'] ?? '',
    paymentDocumentation: json['payment_documentation'] ?? '',
    cancellationPolicy: json['cancellation_policy'] ?? '',
    refundPolicy: json['refund_policy'] ?? '',
    termsConditionPolicy: json['terms_condition_policy'] ?? '',
    paymentStructureContent: json['payment_structure_content'] ?? '',
    documentationContent: json['documentation_content'] ?? '',
    cancellationPolicyContent: json['cancellation_policy_content'] ?? '',
    refundPolicyContent: json['refund_policy_content'] ?? '',
    termPolicyContent: json['term_policy_content'] ?? '',
    costInclusive: json['cost_inclusive'] ?? '',
    costExclusive: json['cost_exclusive'] ?? '',
    tourfaredata: json['tourfaredata'] ?? '',
    sightseingtype: json['sightseingtype'] ?? '',
    sightseeingcategory: json['sightseeingcategory'] ?? '',
    sightseeinglanguage: json['sightseeinglanguage'] ?? '',
    season: json['season'] ?? '',
    thingstocarry: json['thingstocarry'] ?? '',
    meal: json['meal'] ?? '',
    mainimages: json['mainimages'] ?? '',
    galleryimages: json['galleryimages'] ?? '',
    seasonDiscount: json['seasonDiscount'] ?? '',
    seasonDiscountLabel: json['seasonDiscountLabel'] ?? '', 
  );
}
}
