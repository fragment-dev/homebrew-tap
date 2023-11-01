require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3962.0.0-darwin-x64.tar.gz"
    sha256 "b3769c092813705ab0e7c9d4d8c2d7b6a4ab3bfa67087f3b038b09234f4b8027"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3962.0.0-darwin-arm64.tar.gz"
      sha256 "6735a3b33cc3eeecaaa62373792a623029db83b45d2a3c1f49606afc583355fc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3962.0.0-linux-x64.tar.gz"
    sha256 "6afcc3a21f3474e752a809df418982600593223e01addf52955703f7447682bc"
  end
  version "3962.0.0"
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
