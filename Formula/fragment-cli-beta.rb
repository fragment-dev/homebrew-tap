require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5114.0.0-darwin-x64.tar.gz"
    sha256 "66ab93caa8f2411bd1b4523a99bbeaf082d5cddc2bfb2797d55792871ddb395a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5114.0.0-darwin-arm64.tar.gz"
      sha256 "872603fb6fe85f7758592269ab02746c1751d4b4a881491ca24b7be5f544396f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5114.0.0-linux-x64.tar.gz"
    sha256 "4d04c60aa19d447280d417a66e3d7f873b981ba36df36772aae3855d5a1b1a5e"
  end
  version "5114.0.0"
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
