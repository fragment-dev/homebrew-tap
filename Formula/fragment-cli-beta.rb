require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6119.0.0-darwin-x64.tar.gz"
    sha256 "9c12c12f359ecc6e2b7a676667f30d3dc893b43b57f023175fc14de7763bae79"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6119.0.0-darwin-arm64.tar.gz"
      sha256 "93a9213daeae86f0ca35cf9e278b418e51522655116cb0bf8facc13ff536ae85"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6119.0.0-linux-x64.tar.gz"
    sha256 "d13b81b5ce8a7c3e6b7bf76551fc24ba2ea047ea27540a1c3703c0bfc04ae832"
  end
  version "6119.0.0"
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
