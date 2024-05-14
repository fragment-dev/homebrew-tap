require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5046.0.0-darwin-x64.tar.gz"
    sha256 "ebb020a5d49b49c420b59f3ca00101db03c83f8a50e159102a18f95ba99e7944"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5046.0.0-darwin-arm64.tar.gz"
      sha256 "aa14321e813be837a6462ab063b0cbf7e7cbb03c1db59ea616100debfea558b1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5046.0.0-linux-x64.tar.gz"
    sha256 "cd7c2aa10e3537f57fbf18c3cbef01c98c1df1debc85456fcfa0f92b5df1ed90"
  end
  version "5046.0.0"
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
