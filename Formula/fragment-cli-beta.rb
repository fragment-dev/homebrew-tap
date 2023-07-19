require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3121.0.0-darwin-x64.tar.gz"
    sha256 "fb85c15ad29aa749a82be453a3d3a24d2769b5d42c0e4699f49ec5ea95afb614"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3121.0.0-darwin-arm64.tar.gz"
      sha256 "028f720faed8d1e8dbfef7566a8320406b8b4a71e3d351712c66be9f4575a548"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3121.0.0-linux-x64.tar.gz"
    sha256 "531d45f11efd70a57a6d5ee36dea500c225853596622c3bcbb49fbe74daba7ad"
  end
  version "3121.0.0"
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
