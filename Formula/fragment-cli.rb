require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.28-darwin-x64.tar.gz"
    sha256 "23aae89d4baf31fc914f9955144720a7fdec552524e303aaf04e69d2b84a9fa3"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.28-darwin-arm64.tar.gz"
      sha256 "2a7a5f92fcde05d99ff10077596bfea46d08db956392263f16221af523733588"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.28-linux-x64.tar.gz"
    sha256 "eeea06fdd4e82178070d917e1b50097ea219ce4920076699270ac4ae849dcde4"
  end
  version "2023.12.28"
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
