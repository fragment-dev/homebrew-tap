require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4594.0.0-darwin-x64.tar.gz"
    sha256 "e0bddc1dec98f7ac6dcae49f9cb10c0d363baa6dbb1f56061da20343b66d931a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4594.0.0-darwin-arm64.tar.gz"
      sha256 "42fc807a8abf80df1655a7072f7a723a983a0e0f23158e72c3cf7addc813e608"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4594.0.0-linux-x64.tar.gz"
    sha256 "a87120bb08de3990a10d05af4a74f83b7acc309ed0a5f9dc03973ee3231f473a"
  end
  version "4594.0.0"
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
