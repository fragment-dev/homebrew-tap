require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4649.0.0-darwin-x64.tar.gz"
    sha256 "74e71f45e3900806373880076d6c1943af5382a5e57911fc8797de9927bbb012"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4649.0.0-darwin-arm64.tar.gz"
      sha256 "f545751cb61ac034d7054c1f128d4724033bbd84a0f5a9a71eb9a786e9c1d9e2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4649.0.0-linux-x64.tar.gz"
    sha256 "e95aa2b7abbefed2889d147aa2b0a8b02fa56b83fd663a2cba030805b8bf18f8"
  end
  version "4649.0.0"
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
