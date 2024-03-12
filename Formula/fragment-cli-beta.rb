require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4751.0.0-darwin-x64.tar.gz"
    sha256 "212018582d10af90f3bdbc083909482d0cf5c3a475bdb7a99a985af7eb94ec2e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4751.0.0-darwin-arm64.tar.gz"
      sha256 "e7dd07a177be90287ad0af29d82d7d238bf1768ffe44d983bb7e37b0e1c0b865"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4751.0.0-linux-x64.tar.gz"
    sha256 "57a862408d0057678d07558979b41fc1941fa1081ef5c548fad623834cdad99b"
  end
  version "4751.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
