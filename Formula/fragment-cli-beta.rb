require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6037.0.0-darwin-x64.tar.gz"
    sha256 "03bcece619d1f0160eb8ffca8443176170d423f4c0d4af86263d6b0cadbf90c9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6037.0.0-darwin-arm64.tar.gz"
      sha256 "f5cc8825e11fdc173679a438e92476104b4aef6a018c0723d9b815b0af0d405d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6037.0.0-linux-x64.tar.gz"
    sha256 "663e4ad5b9fccc4206e66e579c504c220ad3c009fea109924b6a58e6bcc944f9"
  end
  version "6037.0.0"
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
