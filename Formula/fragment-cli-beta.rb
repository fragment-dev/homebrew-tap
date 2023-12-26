require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4210.0.0-darwin-x64.tar.gz"
    sha256 "5791b1ae282914107713ab0ef87715d04277afe217a96dd125a47442ff3f2a05"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4210.0.0-darwin-arm64.tar.gz"
      sha256 "ed8b65c2ae52faf1bda5632c76fc5bfbd9f8fec4482d1b52dc0454bb457a50e7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4210.0.0-linux-x64.tar.gz"
    sha256 "84b43f92ce5161d6a361da049c84bffb088143ce20c5489702ae970bc100dd85"
  end
  version "4210.0.0"
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
