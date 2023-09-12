require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3528.0.0-darwin-x64.tar.gz"
    sha256 "65bce099a22aa5b61145753d83cfb321d193174dd870d85ea99dc623747a7589"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3528.0.0-darwin-arm64.tar.gz"
      sha256 "644bc6dd6f1cc193c9fcc4ca5ec1d94ee5716703379bbce9e75ebf8e97f64f6b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3528.0.0-linux-x64.tar.gz"
    sha256 "47f32a4258ee1b0b143ccf4f43b315769096586abbac33b4f309e90700555d42"
  end
  version "3528.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
