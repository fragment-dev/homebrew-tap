require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4737.0.0-darwin-x64.tar.gz"
    sha256 "e798314d59e11b28b5bbac1c7bd2d39d1decc57b2a6389113d31a780de88dce9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4737.0.0-darwin-arm64.tar.gz"
      sha256 "e4f811c7edbbe6c9311d57e0627a2f524cb1f59301083a600f2a54e077f312ec"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4737.0.0-linux-x64.tar.gz"
    sha256 "42bdecb119d9afaa9580f54b91dcb1f321a804bb03c3c75aa4b2d2831d80ba13"
  end
  version "4737.0.0"
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
