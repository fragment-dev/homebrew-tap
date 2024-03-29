require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4820.0.0-darwin-x64.tar.gz"
    sha256 "19ec4b46f0fefa6eea3b2dd59e2a6c8160aa22a53b91fd69d887bac845b7406b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4820.0.0-darwin-arm64.tar.gz"
      sha256 "51c1d5d2131d0b6de5d975fbea71a2da523c71c2adfaa8d1e1ed2fbbd6f86b84"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4820.0.0-linux-x64.tar.gz"
    sha256 "ee3622c314578618428a948da98141d648730be1ab9082702a81678d3b3757dc"
  end
  version "4820.0.0"
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
