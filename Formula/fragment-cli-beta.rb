require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3642.0.0-darwin-x64.tar.gz"
    sha256 "d9af9836fcaa8ed21759d447240aefe4137c18f02683aa8e403870186c10739b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3642.0.0-darwin-arm64.tar.gz"
      sha256 "4d5880df02198b79e48987e80043ab3cc49309d5dc774d370d12a77914102c1d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3642.0.0-linux-x64.tar.gz"
    sha256 "47a9e4960282eec095e49ed64dd9e5b050b90b8bab9b9f6490f1f5802221953f"
  end
  version "3642.0.0"
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
