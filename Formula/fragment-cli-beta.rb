require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6833.0.0-darwin-x64.tar.gz"
    sha256 "7fc61059b54ee8a6384eb54723cee8229109345a2217fb9db28c23b64f05c3b2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6833.0.0-darwin-arm64.tar.gz"
      sha256 "fd5951e4126287f871b484a5fa9ce5a79cd4411eb51bcd61ecf46f5c35153722"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6833.0.0-linux-x64.tar.gz"
    sha256 "2c25a160f2a1c3e7503f97646376735b8d2cb345feb3decf6de8377c7fc7e054"
  end
  version "6833.0.0"
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
