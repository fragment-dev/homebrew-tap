require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4303.0.0-darwin-x64.tar.gz"
    sha256 "ec35353da02dd83b4fc5e621ea0cedcd9dadb097e0f8125a1f73f16de8378edb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4303.0.0-darwin-arm64.tar.gz"
      sha256 "bef7dd7529442f863a1a658b37eaec3f1a51b87a2ef62520213d833ac6279a1e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4303.0.0-linux-x64.tar.gz"
    sha256 "bfd3900c235d4335831c40b501eb55100a11036884052228f2100f830f1b5939"
  end
  version "4303.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
