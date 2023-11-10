require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3991.0.0-darwin-x64.tar.gz"
    sha256 "0d804d74f3843dbf2ea2efed0077abb43fafd8f9cfa33f2993e291838da21763"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3991.0.0-darwin-arm64.tar.gz"
      sha256 "e9fdd1ded8601f18d400f3267b5d5e651f87a88f0a649d24f5bd21157654d052"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3991.0.0-linux-x64.tar.gz"
    sha256 "af43f167040adab87b25ccb33e7606c74f85dc423e03a82dd717235390b405d7"
  end
  version "3991.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
