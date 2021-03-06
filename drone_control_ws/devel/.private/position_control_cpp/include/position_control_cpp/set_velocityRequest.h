// Generated by gencpp from file position_control_cpp/set_velocityRequest.msg
// DO NOT EDIT!


#ifndef POSITION_CONTROL_CPP_MESSAGE_SET_VELOCITYREQUEST_H
#define POSITION_CONTROL_CPP_MESSAGE_SET_VELOCITYREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace position_control_cpp
{
template <class ContainerAllocator>
struct set_velocityRequest_
{
  typedef set_velocityRequest_<ContainerAllocator> Type;

  set_velocityRequest_()
    : x(0.0)
    , y(0.0)  {
    }
  set_velocityRequest_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)  {
  (void)_alloc;
    }



   typedef double _x_type;
  _x_type x;

   typedef double _y_type;
  _y_type y;





  typedef boost::shared_ptr< ::position_control_cpp::set_velocityRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::position_control_cpp::set_velocityRequest_<ContainerAllocator> const> ConstPtr;

}; // struct set_velocityRequest_

typedef ::position_control_cpp::set_velocityRequest_<std::allocator<void> > set_velocityRequest;

typedef boost::shared_ptr< ::position_control_cpp::set_velocityRequest > set_velocityRequestPtr;
typedef boost::shared_ptr< ::position_control_cpp::set_velocityRequest const> set_velocityRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::position_control_cpp::set_velocityRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::position_control_cpp::set_velocityRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::position_control_cpp::set_velocityRequest_<ContainerAllocator1> & lhs, const ::position_control_cpp::set_velocityRequest_<ContainerAllocator2> & rhs)
{
  return lhs.x == rhs.x &&
    lhs.y == rhs.y;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::position_control_cpp::set_velocityRequest_<ContainerAllocator1> & lhs, const ::position_control_cpp::set_velocityRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace position_control_cpp

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::position_control_cpp::set_velocityRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::position_control_cpp::set_velocityRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::position_control_cpp::set_velocityRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::position_control_cpp::set_velocityRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::position_control_cpp::set_velocityRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::position_control_cpp::set_velocityRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::position_control_cpp::set_velocityRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "209f516d3eb691f0663e25cb750d67c1";
  }

  static const char* value(const ::position_control_cpp::set_velocityRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x209f516d3eb691f0ULL;
  static const uint64_t static_value2 = 0x663e25cb750d67c1ULL;
};

template<class ContainerAllocator>
struct DataType< ::position_control_cpp::set_velocityRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "position_control_cpp/set_velocityRequest";
  }

  static const char* value(const ::position_control_cpp::set_velocityRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::position_control_cpp::set_velocityRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 x\n"
"float64 y\n"
;
  }

  static const char* value(const ::position_control_cpp::set_velocityRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::position_control_cpp::set_velocityRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct set_velocityRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::position_control_cpp::set_velocityRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::position_control_cpp::set_velocityRequest_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<double>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<double>::stream(s, indent + "  ", v.y);
  }
};

} // namespace message_operations
} // namespace ros

#endif // POSITION_CONTROL_CPP_MESSAGE_SET_VELOCITYREQUEST_H
