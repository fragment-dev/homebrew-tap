require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5081.0.0-darwin-x64.tar.gz"
    sha256 "b789c11ca44a298669e4019d1268dea531c184694089d7b6203203e779772ad7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5081.0.0-darwin-arm64.tar.gz"
      sha256 "44be499238148f44dc54e3f992acea20907351d9f68dd43bd87225fe776a0e6f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5081.0.0-linux-x64.tar.gz"
    sha256 "51fe871855cbf3fac8bfb78b6ea2f3f0329b1f2c602f39a4daa5afdbc2dcc406"
  end
  version "5081.0.0"
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
