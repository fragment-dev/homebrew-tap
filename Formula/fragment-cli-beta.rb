require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5599.0.0-darwin-x64.tar.gz"
    sha256 "ba077c719f1c73dfa317765812f19ee28933be9679d0b24e97021973e06d62be"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5599.0.0-darwin-arm64.tar.gz"
      sha256 "31ab8723f25b92ccd3e544a313df261faabf76b3a8ea83f1ede0de40934e94eb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5599.0.0-linux-x64.tar.gz"
    sha256 "82d8016ab4e94720321eb0c26e098f3b1d322e8ce9d6987f8b648cfb002ea2ca"
  end
  version "5599.0.0"
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
