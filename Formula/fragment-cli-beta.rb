require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5775.0.0-darwin-x64.tar.gz"
    sha256 "be723eed7fc1e94ac81d2f1b6d4ba772f11dc084f3140885c9ff81388536fe53"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5775.0.0-darwin-arm64.tar.gz"
      sha256 "06d546adec93b4459e648bf6f3ed55d59c5cbc5d62a86f460c2102ba0d679f93"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5775.0.0-linux-x64.tar.gz"
    sha256 "a80a46da62a18d8aa76386b9a0143d6e111915e0113566268d880cf60c700631"
  end
  version "5775.0.0"
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
