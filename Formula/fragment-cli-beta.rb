require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4778.0.0-darwin-x64.tar.gz"
    sha256 "3015d9799353819ba46e8850be02b8a06e0667768c830869e8f79542ad3e0da2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4778.0.0-darwin-arm64.tar.gz"
      sha256 "b76338e6c10170be797f14db7a9c2146630f12cfd7270ee0618130da5152598e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4778.0.0-linux-x64.tar.gz"
    sha256 "0befa8a999a1bd4fece3ff31f220bdc67e44176a20ca93c8a589ef32e74fcb5a"
  end
  version "4778.0.0"
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
