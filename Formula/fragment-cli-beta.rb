require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2636.0.0-darwin-x64.tar.gz"
    sha256 "b23e5f154883b6e84e7cfb2281d51eb453ff154d798aacef94ec244c62c91ffa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2636.0.0-darwin-arm64.tar.gz"
      sha256 "e5e74efdcbd9098f227effbd4bec4c707ff69878ba76ab54f4e3cde61677db77"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2636.0.0-linux-x64.tar.gz"
    sha256 "0e530de5d2be4c41b357f0cd35c329f8a9f73b61489f480015b57f484dbeacf7"
  end
  version "2636.0.0"
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
