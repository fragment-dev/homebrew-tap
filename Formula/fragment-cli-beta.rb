require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3395.0.0-darwin-x64.tar.gz"
    sha256 "73ff0efe51c95f0cccb8a67652003cd242ac8aea0977ab68b71ee20da43323c1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3395.0.0-darwin-arm64.tar.gz"
      sha256 "9c8f208d6eb1653f4872fd16b3ae9e496d4e3048761f9e23c32b3ff3dbf60236"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3395.0.0-linux-x64.tar.gz"
    sha256 "110c92ce779e8d1a5696819d5b410a7215c78a5adbcb91deb884075f09588ed8"
  end
  version "3395.0.0"
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
