require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4301.0.0-darwin-x64.tar.gz"
    sha256 "9e1e3ce1ce9e171e1aa0bbfff272dd7948f3929341992f3b5228f38859ebc054"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4301.0.0-darwin-arm64.tar.gz"
      sha256 "75d4b7adb8b23aea2b910db4424374086eecdc568995792412a26c49101e2e5c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4301.0.0-linux-x64.tar.gz"
    sha256 "3f04eeb11d0e2d6d1e6d5716c216a7aa6f2ba3a71bba062885e1dff3d8d30857"
  end
  version "4301.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
