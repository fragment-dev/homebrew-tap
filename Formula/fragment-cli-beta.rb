require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5877.0.0-darwin-x64.tar.gz"
    sha256 "fed2310e459851b6527f5f1cb61ffad427d666836ffe6d8b22875184ce1cd5ee"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5877.0.0-darwin-arm64.tar.gz"
      sha256 "2af095592de5f4f176ab888801f30f8ee0720affa79faca83af4d7a3106a47a7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5877.0.0-linux-x64.tar.gz"
    sha256 "78a30d320e4ae55b574744d8f7792b3306312f9d10e71974229186529890eeda"
  end
  version "5877.0.0"
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
