require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2854.0.0-darwin-x64.tar.gz"
    sha256 "4871c199df177b8899a020383a19421595dc7d958b3e32feb99cf361d5a68612"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2854.0.0-darwin-arm64.tar.gz"
      sha256 "64220368ccd5a01988ee1e97773129ba74f2ea915bb89ae19c01de8681da1189"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2854.0.0-linux-x64.tar.gz"
    sha256 "0bb1839ebc05674c7187478bd3da1deffb4f79947382144f263d106529889619"
  end
  version "2854.0.0"
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
