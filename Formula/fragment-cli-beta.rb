require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3582.0.0-darwin-x64.tar.gz"
    sha256 "ad34db7081e4167d996d1baff4204b97e57ba254bec48b258385bb74e8e1caf1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3582.0.0-darwin-arm64.tar.gz"
      sha256 "c8e7b83d30e738ced1c84322bd289c085a7dde013cbc801981dc3b8a4831b75d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3582.0.0-linux-x64.tar.gz"
    sha256 "fd64b6700b0cd135e2195fccbe1af0020c280b8452af5d10d9a15394cdcd25ca"
  end
  version "3582.0.0"
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
