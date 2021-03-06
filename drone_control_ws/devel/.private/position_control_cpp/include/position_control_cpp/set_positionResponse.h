// Generated by gencpp from file position_control_cpp/set_positionResponse.msg
// DO NOT EDIT!


#ifndef POSITION_CONTROL_CPP_MESSAGE_SET_POSITIONRESPONSE_H
#define POSITION_CONTROL_CPP_MESSAGE_SET_POSITIONRESPONSE_H


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
struct set_positionResponse_
{
  typedef set_positionResponse_<ContainerAllocator> Type;

  set_positionResponse_()
    {
    }
  set_positionResponse_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::position_control_cpp::set_positionResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::position_control_cpp::set_positionResponse_<ContainerAllocator> const> ConstPtr;

}; // struct set_positionResponse_

typedef ::position_control_cpp::set_positionResponse_<std::allocator<void> > set_positionResponse;

typedef boost::shared_ptr< ::position_control_cpp::set_positionResponse > set_positionResponsePtr;
typedef boost::shared_ptr< ::position_control_cpp::set_positionResponse const> set_positionResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::position_control_cpp::set_positionResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::position_control_cpp::set_positionResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace position_control_cpp

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::position_control_cpp::set_positionResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::position_control_cpp::set_positionResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::position_control_cpp::set_positionResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::position_control_cpp::set_positionResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::position_control_cpp::set_positionResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::position_control_cpp::set_positionResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::position_control_cpp::set_positionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::position_control_cpp::set_positionResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::position_control_cpp::set_positionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "position_control_cpp/set_positionResponse";
  }

  static const char* value(const ::position_control_cpp::set_positionResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::position_control_cpp::set_positionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
;
  }

  static const char* value(const ::position_control_cpp::set_positionResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::position_control_cpp::set_positionResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct set_positionResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::position_control_cpp::set_positionResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::position_control_cpp::set_positionResponse_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // POSITION_CONTROL_CPP_MESSAGE_SET_POSITIONRESPONSE_H
