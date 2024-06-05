require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5201.0.0-darwin-x64.tar.gz"
    sha256 "02109da3aa01f41b707c7668e044ed1d5ce5c2879adbd0406cd7e015d54ef180"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5201.0.0-darwin-arm64.tar.gz"
      sha256 "bd679d86b5bd99e99ed484f20e729c2648a13eb55e0a328f7948ce7e65edf27c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5201.0.0-linux-x64.tar.gz"
    sha256 "244da03fc4d60a15130a273c2321b92393a138f339e31039fb41cc106bd30e0d"
  end
  version "5201.0.0"
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
