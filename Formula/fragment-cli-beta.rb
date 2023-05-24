require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2733.0.0-darwin-x64.tar.gz"
    sha256 "3e3b17e8a81f1ca677016b06589c234850ea3efa169893a62edfcc1a0c830e5d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2733.0.0-darwin-arm64.tar.gz"
      sha256 "34d29247489c6a0c4ee47c2229cd1f58210bc8128544ecaf942a8026c81639d1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2733.0.0-linux-x64.tar.gz"
    sha256 "f0eb3d7e270282c04dbcee971a3776d3f2435cd2d9363071cf937ec6b089c547"
  end
  version "2733.0.0"
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
