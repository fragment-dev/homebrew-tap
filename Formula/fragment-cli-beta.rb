require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5102.0.0-darwin-x64.tar.gz"
    sha256 "9556d51ca612a28889f4b47d934e343d7ef07af8532caad85fb4b89e2edef50e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5102.0.0-darwin-arm64.tar.gz"
      sha256 "ff725986a095754505b85bdb1065a5fbdf8aac230fe98483cbf83582f38b21a8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5102.0.0-linux-x64.tar.gz"
    sha256 "43e407d88339db408f30a211919f76cca27375e6216176308eff6e672b2670c1"
  end
  version "5102.0.0"
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
