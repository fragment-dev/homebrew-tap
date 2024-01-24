require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4425.0.0-darwin-x64.tar.gz"
    sha256 "c16bad3cb66451de75bf7459c500482956f32985a834e5a5c19c979c6b30cbd2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4425.0.0-darwin-arm64.tar.gz"
      sha256 "24e5a5e49388cc727496dc5cab124378dbae73784b49aa006a6ba97b94e63721"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4425.0.0-linux-x64.tar.gz"
    sha256 "52aca8e47c115146cbc6a83ef799b9bf2a644360df484fcfcb0f9f0b4710955d"
  end
  version "4425.0.0"
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
