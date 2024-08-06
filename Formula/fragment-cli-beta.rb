require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5475.0.0-darwin-x64.tar.gz"
    sha256 "916bbdc3c041442b8e23cbf762574ad7a4049a8e3b71812be9fe02670ead883c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5475.0.0-darwin-arm64.tar.gz"
      sha256 "5b05aa170ba821b360562b03bf863d97a06c90ddecbbab8a11d7d1f5f786aca8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5475.0.0-linux-x64.tar.gz"
    sha256 "465cd5115adf2381431a2a1eb3595bc69370c6303204b5030638549698c558ff"
  end
  version "5475.0.0"
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
