require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3351.0.0-darwin-x64.tar.gz"
    sha256 "f6c9c1984e3d5e4afa8e4b4529e2b6681994bab97cf072b26319ccc066d32c69"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3351.0.0-darwin-arm64.tar.gz"
      sha256 "e26d820e4e10573bb711b83e4672f09df98fd92cad1822ee8d5cc2e09d1ad8ca"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3351.0.0-linux-x64.tar.gz"
    sha256 "57ff8d159cc8fc4c47296bbee3f1d60289e6eb8a3ddd5cdf982f03e99953c9f8"
  end
  version "3351.0.0"
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
