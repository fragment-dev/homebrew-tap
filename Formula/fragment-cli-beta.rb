require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4084.0.0-darwin-x64.tar.gz"
    sha256 "f089e6781f59b5e91f744beece6f080100bc78436d70f1e91fdab98a18dc8023"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4084.0.0-darwin-arm64.tar.gz"
      sha256 "bbe8a5be175cedd13b55fbbe99b27ed68417e790f667291b443aeacfdcf774b5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4084.0.0-linux-x64.tar.gz"
    sha256 "2b729b0c033e5d5b6082a367b69f2db24ce20df94997a347b6715dbc202ecb0e"
  end
  version "4084.0.0"
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
