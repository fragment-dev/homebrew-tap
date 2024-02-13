require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4546.0.0-darwin-x64.tar.gz"
    sha256 "c8b79cd0f4ad8cbf16ea94986c4c34cd7b69ea7c33e2b191e19c034242a6a686"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4546.0.0-darwin-arm64.tar.gz"
      sha256 "0eb1fef4a64f9862490d061eb5680837a7883e6b4ecab2ce619392238c2397a9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4546.0.0-linux-x64.tar.gz"
    sha256 "1f64e70c096059825afc679f61a29a792f3fef0204768b51386a36abe5eae4e4"
  end
  version "4546.0.0"
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
