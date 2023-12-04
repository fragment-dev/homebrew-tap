require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.4-darwin-x64.tar.gz"
    sha256 "e06a503f90c4e9dbb3854cd1d71666d3c630e254d7ac9596dbc788384db42ead"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.4-darwin-arm64.tar.gz"
      sha256 "f67b9ce67cc00d88cf6ad2a31bf4048b76b636c3229f35a3b57769b6524106fe"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.4-linux-x64.tar.gz"
    sha256 "e5936681eb2cf1ced5200199526289e05e758aecdbb4318b98e892c19fda7587"
  end
  version "2023.12.4"
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
