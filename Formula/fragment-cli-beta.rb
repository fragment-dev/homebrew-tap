require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4370.0.0-darwin-x64.tar.gz"
    sha256 "991bf0e878337f87b08f2184b16fd089f0a1e1f16198336b16cd6e711a840986"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4370.0.0-darwin-arm64.tar.gz"
      sha256 "d2ba4f9c1251ef399597bc57bd6d20870deefc3ae2fa8976429a5809b1dbca08"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4370.0.0-linux-x64.tar.gz"
    sha256 "cdad8c1cd935354ceccdbeb334524ed01795cb84e3df2eb65aef15d8933b470b"
  end
  version "4370.0.0"
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
