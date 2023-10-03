require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3742.0.0-darwin-x64.tar.gz"
    sha256 "3abe30a10b04f1c81ffa296402d93dad60f9d63521c8bcf191205155484b7574"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3742.0.0-darwin-arm64.tar.gz"
      sha256 "5e330e763d3d3fe931dedd6c0fbd126981f082e956119d48b188bc6ce5b7d2e0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3742.0.0-linux-x64.tar.gz"
    sha256 "a448cfee91e838481a10f8c7b74ef11a67549d4028b4ca179124f65aad1c1bc8"
  end
  version "3742.0.0"
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
