require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5041.0.0-darwin-x64.tar.gz"
    sha256 "88cbfc3e7c1e360cd81c2a91562238f3734fbb38156ca1ac96ea9852b5de66dd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5041.0.0-darwin-arm64.tar.gz"
      sha256 "d951ced57484448228b1377751423f45218b7ac84f3f93dd1397ef53ca36e62c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5041.0.0-linux-x64.tar.gz"
    sha256 "8f47a103cfc05cc2ad0e471f77aabcc5c977b05b0da98adad62b98c0eaa75fec"
  end
  version "5041.0.0"
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
