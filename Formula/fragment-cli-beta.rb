require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4082.0.0-darwin-x64.tar.gz"
    sha256 "99220319ffc6b6bd28e6b948427a506dffc1d6b5adc92dd7295d3a7e7b91a7f7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4082.0.0-darwin-arm64.tar.gz"
      sha256 "25db8b22f1960925358311326dc7bbfddbba37c004a326cb5d4635cf32f90357"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4082.0.0-linux-x64.tar.gz"
    sha256 "75e9d4888ef797b65d8b696a4278697eb98bc7dd8189e7d3ce4cf38fb24e56d4"
  end
  version "4082.0.0"
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
