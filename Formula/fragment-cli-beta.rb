require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4389.0.0-darwin-x64.tar.gz"
    sha256 "38ef75829ec4cf3a93c1a47e3b93c3bb8d8afb21db039cbdf45a68a24e5f1b8d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4389.0.0-darwin-arm64.tar.gz"
      sha256 "113400ef7ae83b169c853ac5b4126f5ef451ab76c081ce511778c287ba2a329c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4389.0.0-linux-x64.tar.gz"
    sha256 "be976a621764edc27fea88c740d168d5e4b3174b4de1f438c201a4f4c65fba55"
  end
  version "4389.0.0"
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
