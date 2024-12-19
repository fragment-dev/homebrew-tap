require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5936.0.0-darwin-x64.tar.gz"
    sha256 "d9ba4f436a954fb3066e8d5330a5b525451cf7c4e631120c50632adfaf264a7d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5936.0.0-darwin-arm64.tar.gz"
      sha256 "5b1fe2b5796470554e98218132897e5d28603106d7572bc5483df91f71d401b0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5936.0.0-linux-x64.tar.gz"
    sha256 "9cc0092e516f6cce4e71e13fc2c14deeadd36e9bfa3b7e23e7b6811d66ae4fd7"
  end
  version "5936.0.0"
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
