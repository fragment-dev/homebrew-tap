require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1.0.0-darwin-x64.tar.gz"
    sha256 "f5c1f50d3372d9268cabc4bbae1901f8c7198dcad485460acd5a6b18b5c2fdb0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1.0.0-darwin-arm64.tar.gz"
      sha256 "488c94953494c187c1997a87ca3079295586372205298f167bd2367f7cf05702"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1.0.0-linux-x64.tar.gz"
    sha256 "256034762a6276897d810af544f151cd1549b0d629391162c0aa1b8aefed1a17"
  end
  version "1.0.0"
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
