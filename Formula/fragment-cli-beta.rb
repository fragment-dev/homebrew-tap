require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3332.0.0-darwin-x64.tar.gz"
    sha256 "88fe03cbecf16ff5ee384a22c07c99b35ddb0f864c878a2a9dc4cbad3867f0c6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3332.0.0-darwin-arm64.tar.gz"
      sha256 "ad51bfe69b559c13c8b434e165669d8187eed2fe1386b796b431338d395ff624"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3332.0.0-linux-x64.tar.gz"
    sha256 "b5e5defad2a9f2c23ae4bf26013dbaa98094c486d7fd3e5682d91505f48d08e2"
  end
  version "3332.0.0"
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
