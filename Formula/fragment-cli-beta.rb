require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4812.0.0-darwin-x64.tar.gz"
    sha256 "bfdaec3b6e778f349855bfdef53abbd5f66b6de9aa077658c476adddd6d604fd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4812.0.0-darwin-arm64.tar.gz"
      sha256 "13ad34c2923651baefcb1c1c531d5297f9003145e15ba3376b1a094b7c57bb0a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4812.0.0-linux-x64.tar.gz"
    sha256 "50abf7ff7e64ab245d464692782535086778fb979187e05ff370024636ab0d67"
  end
  version "4812.0.0"
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
