require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5596.0.0-darwin-x64.tar.gz"
    sha256 "8f6f511ebcf655698f3cce7a98f8895d92d61dbf211ec682a3a80262cc87a1d7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5596.0.0-darwin-arm64.tar.gz"
      sha256 "a1108ffea841ada8e43093325a764fab659b1335913c5e70712021882084e532"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5596.0.0-linux-x64.tar.gz"
    sha256 "d6bb064960ce9fe954f74f89889f2194d67f3b2537bf2b790d8aa817fbd6d750"
  end
  version "5596.0.0"
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
