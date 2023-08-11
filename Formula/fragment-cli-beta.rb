require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3285.0.0-darwin-x64.tar.gz"
    sha256 "1217de9c1121a3b38c493d180d74ef99c12f9f7aca71bbbc63aeef626f9b2e7e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3285.0.0-darwin-arm64.tar.gz"
      sha256 "44079438d243530965bdd364b151b25676d46174487f24a510ad06fea6489d82"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3285.0.0-linux-x64.tar.gz"
    sha256 "56b11dbeb1c6d02848d9fb8c5e041f8c14ad90891c88b41884f08f277880676b"
  end
  version "3285.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
