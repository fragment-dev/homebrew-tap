require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3410.0.0-darwin-x64.tar.gz"
    sha256 "5f89cdf6e038521857d0ad4567e4d5a8887215e99ce41557637461ec34cb19f4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3410.0.0-darwin-arm64.tar.gz"
      sha256 "7a052862c7fad9ce00eca01646bd030c41995004959821f9089506cbf53f9a00"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3410.0.0-linux-x64.tar.gz"
    sha256 "096ed530cc9d9d23f0fe2e0e8d306d5b64d68722bbec5491db13a0a250aeb8b5"
  end
  version "3410.0.0"
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
