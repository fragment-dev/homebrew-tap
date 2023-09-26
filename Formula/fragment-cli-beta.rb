require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3667.0.0-darwin-x64.tar.gz"
    sha256 "cc59d24430768b55b86a61b2e1e420dcfb19eac1148224d5fac501aa4129a055"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3667.0.0-darwin-arm64.tar.gz"
      sha256 "5cdcce96f217cf7ced1f310a236f9da6d8e750eac4f343a18ec42aeeb5fa414e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3667.0.0-linux-x64.tar.gz"
    sha256 "7de5074478061f115f3b1605798febe546f627ad835467066547f37f9000d1c9"
  end
  version "3667.0.0"
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
