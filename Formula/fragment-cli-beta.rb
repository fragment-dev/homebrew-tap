require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4629.0.0-darwin-x64.tar.gz"
    sha256 "3e52491b4c58a4ebd38085af6bb5983b80543d605ad243cf59ae61807f1e9a18"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4629.0.0-darwin-arm64.tar.gz"
      sha256 "fa9948b29f2f4a96bc6bf87a8444fece9cb7e39a87767b835daf90a26643a2ff"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4629.0.0-linux-x64.tar.gz"
    sha256 "087cb52fb0d83823e16331273c1a52b01bd6259a8ffe8001807f076f4435b5e0"
  end
  version "4629.0.0"
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
